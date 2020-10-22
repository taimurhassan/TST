import cv2
import numpy as np
import os
from scipy import signal
from sklearn.preprocessing import MinMaxScaler

def scale_feature(scaler,feature):
    scaler.fit(feature)
    return scaler.transform(feature)


def remove_center_line(img,threshold):
    rows,cols,_ = img.shape
    crow,ccol = rows//2 , cols//2
    mw = 10
    center_reg = img[:,ccol-mw:ccol+mw,:]

    idx = np.where(np.all(center_reg>threshold,axis=2))

    sorted_cr = np.sort(center_reg[idx[0]],axis=1)
    if(center_reg.shape[1]%2==0):
        median_vals = np.mean(sorted_cr[:,mw:mw+2],axis=1)
    else:
        median_vals = sorted_cr[:,center_reg.shape[1]//2]

    center_reg[idx] = median_vals
    img[:,ccol-mw:ccol+mw,:] = center_reg
    return img

def set_white_roc(img,roc,threshold):
    (c1,r1),(c2,r2) = roc
    reg = img[r1:r2,c1:c2,:]
    idx = np.where(np.all(reg>threshold,axis=2))
    reg[idx[0],idx[1],:] = 0
    img[r1:r2,c1:c2,:] = reg
    return img


def structureTensor(I,si,so):
    I = I.astype(np.float64)
    m,n = I.shape

    x = np.arange(-2*si,2*si+1,1)
    g  = np.exp(-0.5*(x/si)**2);
    g  = g/sum(g);
    gd = -x*g/(si**2);
    tg = np.transpose(g)
    tgd = np.transpose(gd)

    tempy = np.apply_along_axis(np.convolve, 1, I, gd, 'same')

    tempx = np.apply_along_axis(np.convolve, 0, I, tgd, 'same')


    Iy = np.apply_along_axis(np.convolve, 0, tempy, tg, 'same')
    Ix = np.apply_along_axis(np.convolve, 1, tempx, g, 'same')


    Iyy = Iy**2;
    Ixx = Ix**2;

    x  = np.arange(-2*so,2*so+1,1)
    g  = np.exp(-0.5*(x/so)**2);
    tg = np.transpose(g)

    tempsyy = np.apply_along_axis(np.convolve, 1, Iyy, g, 'same')
    Syy = np.apply_along_axis(np.convolve, 0, tempsyy, tg, 'same')

    tempsxx = np.apply_along_axis(np.convolve, 1, Ixx, g, 'same')
    Sxx = np.apply_along_axis(np.convolve, 0, tempsxx, tg, 'same')


    return Sxx,Syy

    # Iy = signal.convolve2d(,g,'same',axis=1);



img_path = 'NORMAL/P1/LT/resized_480by1280_frames/' # update these paths as per your dataset
out_path = 'frames/resized_480by1280/'
total_frames = 128

for i in range(1,total_frames+1):

    img_idx = i
    img_name = f'frame{img_idx}.jpg'
    img = cv2.imread(img_path+img_name)

    row,col,_ = img.shape
    mw=30

    #Remove white annotations
    img = remove_center_line(img,20)
    img = set_white_roc(img,[(0,0),(338, 91)],30)
    img = set_white_roc(img,[(652, 0),(811, 215)],110)

    #Remove heatbar annotation
    img[row-mw:,:,:] = 0

    imgg = img.copy()[:,:,1]
    imgg[imgg>200] = 0
    imgg[imgg<30] = 0
    imgr = img.copy()[:,:,2]

    # imgg = cv2.medianBlur(imgg,3)


    sxxg,syyg = structureTensor(imgg,10,1)
    sxxr,syyr = structureTensor(imgr,10,1)

    scaler = MinMaxScaler()


    sxxg_norm = scale_feature(scaler,sxxg)
    sxxr_norm = scale_feature(scaler,sxxr)

    sxxg_norm = (sxxg_norm*255).astype(np.uint8)
    sxxr_norm = (sxxr_norm*255).astype(np.uint8)

    out_img = np.zeros((img.shape[0],img.shape[1],3),dtype=np.uint8)

    out_img[:,:,1] = sxxg_norm
    out_img[:,:,2] = sxxr_norm


    # cv2.imshow(img_name,out_img)
    # cv2.imwrite(f'{out_path}{img_idx-1}.png',out_img,[cv2.IMWRITE_PNG_COMPRESSION,0])
    cv2.imshow(img_name+'1',img)

print('Done!')
# cv2.waitKey(0)
cv2.destroyAllWindows()

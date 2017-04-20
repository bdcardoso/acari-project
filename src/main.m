clear all

% PERGUNTAS
%
% 1) Como retiro a funcionalidade de manter uma ROI no inicio das frames?
% 2) Como e que faco a funcionalidade de vis. da trajectoria?
% 2.1) Pode ser as varias box ao longo do tempo?
% 3) O que e o num de deteccao de falhas?
% 4) Que key-frames sao estas?
%

%imgbk = imread('../frames/SonofMated2/SonofMated200001.jpg');
imgbk = imread('../frames/SonofMated10/SonofMated1000262.jpg');

thr = 25;
minArea = 50;
baseNum = 262;
seqLength = 5333;

se = strel('disk',3);

nFrame= 40*25;
step=20;

Bkg=zeros(size(imgbk));
alfa=0.05;
figure; hold on

%Exprimentar varios valores para ALPHA

for i = 1 : step : nFrame
    i
    imgBase = imread(sprintf('../frames/SonofMated10/SonofMated10%.5d.jpg',baseNum+i));
    Y = imgBase;
    Bkg = alfa * double(Y) + (1-alfa) * double(Bkg);
    imshow(uint8(Bkg)); drawnow
end

% ------------ Fim ------------------- %

%figure;
% for i=0:seqLength
%     %imgfr = imread(sprintf('../frames/SonofMated2/SonofMated2%.5d.jpg',baseNum+i));
%     imgfr = imread(sprintf('../frames/SonofMated10/SonofMated10%.5d.jpg',baseNum+i));
%     hold off
%     %imshow(imgfr);
%     
%     imgdif = (abs(double(imgbk(:,:,1))-double(imgfr(:,:,1)))>thr) | ...
%         (abs(double(imgbk(:,:,2))-double(imgfr(:,:,2)))>thr) | ...
%         (abs(double(imgbk(:,:,3))-double(imgfr(:,:,3)))>thr);
%     
%     bw = imclose(imgdif,se);
%     %imshow(bw)
%     [lb num]=bwlabel(bw);
%     regionProps = regionprops(lb,'area','FilledImage','Centroid');
%     inds = find([regionProps.Area]>minArea);
%     
%     regnum = length(inds);
%     
%     if regnum
%         for j=1:regnum
%             [lin col]= find(lb == inds(j));
%             upLPoint = min([lin col]);
%             dWindow  = max([lin col]) - upLPoint + 1;
%            
%             rectangle('Position', ...
%                       [fliplr(upLPoint) fliplr(dWindow)], ...
%                       'EdgeColor',[1 1 0], ...
%                       'linewidth',2);
%         end
%     end
%     %drawnow
% end
    
    

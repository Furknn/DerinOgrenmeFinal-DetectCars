%arac�n bulundugu resim
function f=detectCar(scene,)
scene1=scene;
s=size(scene1);
if (s(1)>92&&s(2)>121)
    winc=91*floor((s(1)/91)/5);
    hinc=120*floor((s(2)/120)/5);
    wb=1;%yatay ba�lang��
    hb=1;%d��ey ba�lang�c
    for ws=winc:winc:floor(s(1)/winc)*winc%yatay da ilerleyen d�ng�
        for hs=hinc:hinc:floor(s(2)/hinc)*hinc%d��eyde ilerleyen d�ng�
            %kesilen bolgeyi s�n�fland�r
            pred=mynet.classify(imresize(scene1(wb:ws,hb:hs,:),[91 120]));
            %Positive ise etraf�na kare �iz
            if pred=="Positive"

                scene1(wb:wb+5,hb:hs,1)=255;
                scene1(wb:wb+5,hb:hs,2)=0;
                scene1(wb:wb+5,hb:hs,3)=0;

                scene1(ws-5:ws,hb:hs,1)=255;
                scene1(ws-5:ws,hb:hs,2)=0;
                scene1(ws-5:ws,hb:hs,3)=0;

                scene1(wb:ws,hb:hb+5,1)=255;
                scene1(wb:ws,hb:hb+5,2)=0;
                scene1(wb:ws,hb:hb+5,3)=0;

                scene1(wb:ws,hs-5:hs,1)=255;
                scene1(wb:ws,hs-5:hs,2)=0;
                scene1(wb:ws,hs-5:hs,3)=0;

            end
            %d��ey ba�lang�c de�erini artt�r
            hb=hb+hinc;
        end
        hb=1;
        %yatay ba�lang�c de�erini artt�r
        wb=wb+winc;
    end
else
    pred=mynet.classify(imresize(scene1,[91 120]));
    %Positive ise etraf�na kare �iz
    if pred=="Positive"

        scene1(1:5,:,1)=255;
        scene1(1:5,:,2)=0;
        scene1(1:5,:,3)=0;

        scene1(max(s(1))-5:max(s(1)),:,1)=255;
        scene1(max(s(1))-5:max(s(1)),:,2)=0;
        scene1(max(s(1))-5:max(s(1)),:,3)=0;

        scene1(:,1:5,1)=255;
        scene1(:,1:5,2)=0;
        scene1(:,1:5,3)=0;

        scene1(:,max(s(2))-5:max(s(2)),1)=255;
        scene1(:,max(s(2))-5:max(s(2)),2)=0;
        scene1(:,max(s(2))-5:max(s(2)),3)=0;

    end
end

imshow(scene1)
clear c hb hs s wb ws hinc winc

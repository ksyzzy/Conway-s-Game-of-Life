function gameoflife(rows,columns,iterations)
    

matrix_1=zeros(rows,columns);
matrix_2=zeros(rows,columns);
table=[-1,-1,0,-1,1,-1,1,0,1,1,0,1,-1,1,-1,0];
    
for i=1:rows
      for j=1:columns
           matrix_1(i,j)=3*round(rand());    
      end
end    

clf();

xtitle("Game of Life")

f = gcf();
f.figure_name = gettext("Game of Life")
f.axes_size=[645,840];

ax = gca();
ax.data_bounds = [0, 0 ; 100, 100];
//ax.box = "on";

generation=[0];
sum_a=[sum(matrix_1==3)]; 

subplot(211);
   Matplot1(matrix_1,[0,0,100,100]);
   mp=gce();
   
subplot(212);
   xtitle("Wykres 1")
   xlabel("generation")
   ylabel("alive")
   plot2d(generation,sum_a);
   


for step=1:iterations  
  for i=1:rows
        for j=1:columns
            s=0;
            for k=1:2:length(table)
                row_i=i+table(k);
                column_j=j+table(k+1);
                if row_i>=1 & row_i<=rows & column_j>=1 & column_j<=columns then
                   if matrix_1(row_i,column_j)==3 then s=s+1; end
                end
            end 
            if s<2  then
                matrix_2(i,j)=0;
            elseif s>3 then 
                matrix_2(i,j)=0;
            elseif s==3 then
                matrix_2(i,j)=3;
            elseif s==2 & matrix_1(i,j)==3 then
                matrix_2(i,j)=3
            end       
        end
    end
    
    for i=1:rows
        for j=1:columns
        matrix_1(i,j)=matrix_2(i,j)       
        end
    end
    
    subplot(211);
    mp.data=matrix_1;
    
    generation=[generation step];
    sum_a= [sum_a sum(matrix_1==3)];
  
   subplot(212);
   plot2d(generation,sum_z);
end
    
endfunction

disp("Conway''s Game of Life");
disp("Usage: gameoflife(rows,colmuns,iterations)");
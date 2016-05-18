M[16],X=16,W,k;main(){T(system("stty cbreak")
);puts(W&1?"WIN":"LOSE");}K[]={2,3,1};s(f,d,i
,j,l,P){for(i=4;i--;)for(j=k=l=0;k<4;)j<4?P=M
[w(d,i,j++)],W|=P>>11,l*P&&(f?M[w(d,i,k)]=l<<
(l==P):0,k++),l=l?P?l-P?P:0:l:P:(f?M[w(d,i,k)
]=l:0,++k,W|=2*!l,l=0);}w(d,i,j){return d?w(d
-1,j,3-i):4*i+j;}T(i){for(i=X+rand()%X;M[i%X]
*i;i--);i?M[i%X]=2<<rand()%2:0;for(W=i=0;i<4;
)s(0,i++);for(i=X,puts("\e[2J\e[H");i--;i%4||
puts(""))printf(M[i]?"%4d|":"    |",M[i]);W-2
||read(0,&k,3)|T(s (1,K[(k>>X)%4]));}//[2048]

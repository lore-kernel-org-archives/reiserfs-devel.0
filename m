From: Anton Erofeevskij <ae@ap-plastic.ru>
Subject: !?!
Date: Wed, 08 Jan 2003 11:53:26 +0500
Message-ID: <3E1BCAE6.9000408@ap-plastic.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12290-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

very small programm


#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>

main(int arg, char *argc[]){
    int i;

    while(1){
        if(read(0,&i,4)!=4)
            exit(0);
        write(1,&i,4);
        }
    }


file sd1 - 1mb


in reiserfs filesystem
time cat sd1 | ./a.out > sd2
0.00user 0.05system 0:01.79elapsed 2%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (131major+43minor)pagefaults 0swaps



in ext2 filesystem
time cat sd1 | ./a.out > sd2
0.00user 0.05system 0:00.95elapsed 2%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (131major+43minor)pagefaults 0swaps


In what the reason?!?
sory





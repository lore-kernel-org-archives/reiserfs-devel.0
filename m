From: <doiggl@velocitynet.com.au>
Subject: Has anyone ever compiled the Reiser4 demo programs ?
Date: Sat, 06 Aug 2016 23:25:03 +1000
Message-ID: <819f0d4abe0d44ecc88c935af00724a6@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello 
Has anyone ever compiled the Reiser4 demo programs

If so what commands were used ?

--Glenn

I get this: 

/tmp/reiser4progs-1.1.0/demos # gcc  ls.c
In file included from ls.c:6:0:
busy.h:17:23: fatal error: misc/misc.h: No such file or directory
 #include <misc/misc.h>
                       ^
compilation terminated.

/tmp/reiser4progs-1.1.0/demos # ll /tmp/reiser4progs-1.1.0/demos
total 100
-rw-r--r-- 1 root users   394 Jan  9  2009 Makefile.am
-rw-r--r-- 1 root users 33088 Aug 24  2015 Makefile.in
-rw-r--r-- 1 root users 13597 Jan  9  2009 busy.c
-rw-r--r-- 1 root users  1409 Jan  9  2009 busy.h
-rw-r--r-- 1 root users  4368 Jan  9  2009 cp.c
-rw-r--r-- 1 root users  1559 Jan  9  2009 create.c
-rw-r--r-- 1 root users  1263 Jan  9  2009 detect
-rw-r--r-- 1 root users  1736 Jan  9  2009 ln.c
-rw-r--r-- 1 root users  1048 Jan  9  2009 ls.c
-rw-r--r-- 1 root users   761 Jan  9  2009 misc.c
-rw-r--r-- 1 root users  1419 Jan  9  2009 rm.c
-rw-r--r-- 1 root users   917 Jan  9  2009 stat.c
-rw-r--r-- 1 root users  1158 Aug 24  2015 trunc.c


/tmp/reiser4progs-1.1.0/demos # ll  /tmp/reiser4progs-1.1.0/include 
/tmp/reiser4progs-1.1.0/include/misc
/tmp/reiser4progs-1.1.0/include:
total 25
-rw-r--r-- 1 root users    34 Jan  9  2009 Makefile.am
-rw-r--r-- 1 root users 18296 Aug 24  2015 Makefile.in
drwxr-xr-x 2 root users   184 Aug 30  2015 aux
drwxr-xr-x 2 root users   312 Aug 30  2015 misc
drwxr-xr-x 2 root users   760 Aug 30  2015 reiser4                        
                                                                          
        
drwxr-xr-x 2 root users   760 Aug 30  2015 repair                         
                                                                          
        
                                                                          
                                                                          
        
/tmp/reiser4progs-1.1.0/include/misc:                                     
                                                                          
         
total 48                                                                  
                                                                          
         
-rw-r--r-- 1 root users    81 Jan  9  2009 Makefile.am                    
                                                                          
         
-rw-r--r-- 1 root users 14091 Aug 24  2015 Makefile.in                    
                                                                          
         
-rw-r--r-- 1 root users   404 Jan  9  2009 exception.h                    
                                                                          
         
-rw-r--r-- 1 root users   280 Jan  9  2009 gauge.h                        
                                                                          
         
-rw-r--r-- 1 root users  1873 Jan  9  2009 misc.h                         
                                                                          
         
-rw-r--r-- 1 root users   449 Jan  9  2009 mpressure.h                    
                                                                          
         
-rw-r--r-- 1 root users   340 Jan  9  2009 profile.h                      
                                                                          
          
-rw-r--r-- 1 root users   641 Jan  9  2009 ui.h                           
                                                                          
          
-rw-r--r-- 1 root users   479 Aug 24  2015 version.h                      
                                                                          
          

# gcc  -I /tmp/reiser4progs-1.1.0/include -I
/tmp/reiser4progs-1.1.0/include/misc   ls.c
/usr/lib64/gcc/x86_64-suse-linux/4.8/../../../../lib64/crt1.o: In function
`_start':
/home/abuild/rpmbuild/BUILD/glibc-2.19/csu/../sysdeps/x86_64/start.S:118:
undefined reference to `main'
/tmp/ccTReqOc.o: In function `ls_cmd':
ls.c:(.text+0x46): undefined reference to `aal_exception_throw'
ls.c:(.text+0x7a): undefined reference to `aal_exception_throw'
ls.c:(.text+0xb2): undefined reference to `reiser4_semantic_open'
ls.c:(.text+0xe4): undefined reference to `aal_exception_throw'
ls.c:(.text+0x117): undefined reference to `reiser4_print_key'
ls.c:(.text+0x14d): undefined reference to `reiser4_object_readdir'
ls.c:(.text+0x171): undefined reference to `reiser4_print_key'
ls.c:(.text+0x192): undefined reference to `reiser4_object_close'
collect2: error: ld returned 1 exit status

using opensuse
reiser4progs-1.1.0.tar.gz


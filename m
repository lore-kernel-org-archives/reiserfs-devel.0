From: Yoanis Gil Delgado <fred@lab.matcom.uh.cu>
Subject: error compiling reiser4 for kernel 2.6.13.1
Date: Thu, 20 Oct 2005 21:06:22 -0400
Message-ID: <200510202106.22388.fred@lab.matcom.uh.cu>
Mime-Version: 1.0
Content-Type: multipart/alternative;
  boundary="Boundary-00=_O8DWDwmu+6gw1uZ"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26589-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Boundary-00=_O8DWDwmu+6gw1uZ
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi i just downloaded the 2.6.13.1 kernel source and the reiser4 patch for this 
kernel (reiser4-for-2.6.13-1.patch). When compiling i get the following 
error:

  LD      fs/reiser4/built-in.o
  CC [M]  fs/reiser4/debug.o
In file included from fs/reiser4/lock.h:15,
                 from fs/reiser4/context.h:14,
                 from fs/reiser4/debug.c:25:
fs/reiser4/txnmgr.h: In function `spin_atom_init':
fs/reiser4/txnmgr.h:512: error: duplicate case value
fs/reiser4/txnmgr.h:512: error: previously used here
fs/reiser4/txnmgr.h: In function `spin_txnh_init':
fs/reiser4/txnmgr.h:513: error: duplicate case value
fs/reiser4/txnmgr.h:513: error: previously used here
fs/reiser4/txnmgr.h: In function `spin_txnmgr_init':
fs/reiser4/txnmgr.h:514: error: duplicate case value
fs/reiser4/txnmgr.h:514: error: previously used here
In file included from fs/reiser4/context.h:14,
                 from fs/reiser4/debug.c:25:
fs/reiser4/lock.h: In function `spin_stack_init':
fs/reiser4/lock.h:198: error: duplicate case value
fs/reiser4/lock.h:198: error: previously used here
In file included from fs/reiser4/znode.h:16,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/super.h:9,
                 from fs/reiser4/debug.c:26:
fs/reiser4/jnode.h: In function `spin_jnode_init':
fs/reiser4/jnode.h:344: error: duplicate case value
fs/reiser4/jnode.h:344: error: previously used here
fs/reiser4/jnode.h: In function `spin_jload_init':
fs/reiser4/jnode.h:348: error: duplicate case value
fs/reiser4/jnode.h:348: error: previously used here
In file included from fs/reiser4/super.h:9,
                 from fs/reiser4/debug.c:26:
fs/reiser4/tree.h: In function `spin_epoch_init':
fs/reiser4/tree.h:169: error: duplicate case value
fs/reiser4/tree.h:169: error: previously used here
In file included from fs/reiser4/debug.c:26:
fs/reiser4/super.h: In function `spin_super_init':
fs/reiser4/super.h:379: error: duplicate case value
fs/reiser4/super.h:379: error: previously used here
make[2]: *** [fs/reiser4/debug.o] Error 1
make[1]: *** [fs/reiser4] Error 2
make: *** [fs] Error 2

Here is the output from the gcc version:
sena:/usr/src/linux# gcc -v
Reading specs from /usr/lib/gcc-lib/i486-linux-gnu/3.3.6/specs
Configured with: ../src/configure -v 
--enable-languages=c,c++,java,f77,pascal,objc,ada,treelang --prefix=/usr 
--mandir=/usr/share/man --infodir=/usr/share/info 
--with-gxx-include-dir=/usr/include/c++/3.3 --enable-shared 
--enable-__cxa_atexit --with-system-zlib --enable-nls 
--without-included-gettext --enable-clocale=gnu --enable-debug 
--enable-java-gc=boehm --enable-java-awt=xlib --enable-objc-gc i486-linux-gnu
Thread model: posix
gcc version 3.3.6 (Debian 1:3.3.6-7)

One more thing, i patched the 2.6.13 kernel (not the 2.6.13.1) and i got no 
compilation error. Thanks and best wishes...................yoanis

--Boundary-00=_O8DWDwmu+6gw1uZ
Content-Type: text/html;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

<html><head><meta name="qrichtext" content="1" /></head><body style="font-size:10pt;font-family:Bitstream Vera Sans">
<p>Hi i just downloaded the 2.6.13.1 kernel source and the reiser4 patch for this kernel (reiser4-for-2.6.13-1.patch). When compiling i get the following error:</p>
<p></p>
<p><span style="font-weight:600">  LD      fs/reiser4/built-in.o</span></p>
<p><span style="font-weight:600">  CC [M]  fs/reiser4/debug.o</span></p>
<p><span style="font-weight:600">In file included from fs/reiser4/lock.h:15,</span></p>
<p><span style="font-weight:600">                 from fs/reiser4/context.h:14,</span></p>
<p><span style="font-weight:600">                 from fs/reiser4/debug.c:25:</span></p>
<p><span style="font-weight:600">fs/reiser4/txnmgr.h: In function `spin_atom_init':</span></p>
<p><span style="font-weight:600">fs/reiser4/txnmgr.h:512: error: duplicate case value</span></p>
<p><span style="font-weight:600">fs/reiser4/txnmgr.h:512: error: previously used here</span></p>
<p><span style="font-weight:600">fs/reiser4/txnmgr.h: In function `spin_txnh_init':</span></p>
<p><span style="font-weight:600">fs/reiser4/txnmgr.h:513: error: duplicate case value</span></p>
<p><span style="font-weight:600">fs/reiser4/txnmgr.h:513: error: previously used here</span></p>
<p><span style="font-weight:600">fs/reiser4/txnmgr.h: In function `spin_txnmgr_init':</span></p>
<p><span style="font-weight:600">fs/reiser4/txnmgr.h:514: error: duplicate case value</span></p>
<p><span style="font-weight:600">fs/reiser4/txnmgr.h:514: error: previously used here</span></p>
<p><span style="font-weight:600">In file included from fs/reiser4/context.h:14,</span></p>
<p><span style="font-weight:600">                 from fs/reiser4/debug.c:25:</span></p>
<p><span style="font-weight:600">fs/reiser4/lock.h: In function `spin_stack_init':</span></p>
<p><span style="font-weight:600">fs/reiser4/lock.h:198: error: duplicate case value</span></p>
<p><span style="font-weight:600">fs/reiser4/lock.h:198: error: previously used here</span></p>
<p><span style="font-weight:600">In file included from fs/reiser4/znode.h:16,</span></p>
<p><span style="font-weight:600">                 from fs/reiser4/tree.h:15,</span></p>
<p><span style="font-weight:600">                 from fs/reiser4/super.h:9,</span></p>
<p><span style="font-weight:600">                 from fs/reiser4/debug.c:26:</span></p>
<p><span style="font-weight:600">fs/reiser4/jnode.h: In function `spin_jnode_init':</span></p>
<p><span style="font-weight:600">fs/reiser4/jnode.h:344: error: duplicate case value</span></p>
<p><span style="font-weight:600">fs/reiser4/jnode.h:344: error: previously used here</span></p>
<p><span style="font-weight:600">fs/reiser4/jnode.h: In function `spin_jload_init':</span></p>
<p><span style="font-weight:600">fs/reiser4/jnode.h:348: error: duplicate case value</span></p>
<p><span style="font-weight:600">fs/reiser4/jnode.h:348: error: previously used here</span></p>
<p><span style="font-weight:600">In file included from fs/reiser4/super.h:9,</span></p>
<p><span style="font-weight:600">                 from fs/reiser4/debug.c:26:</span></p>
<p><span style="font-weight:600">fs/reiser4/tree.h: In function `spin_epoch_init':</span></p>
<p><span style="font-weight:600">fs/reiser4/tree.h:169: error: duplicate case value</span></p>
<p><span style="font-weight:600">fs/reiser4/tree.h:169: error: previously used here</span></p>
<p><span style="font-weight:600">In file included from fs/reiser4/debug.c:26:</span></p>
<p><span style="font-weight:600">fs/reiser4/super.h: In function `spin_super_init':</span></p>
<p><span style="font-weight:600">fs/reiser4/super.h:379: error: duplicate case value</span></p>
<p><span style="font-weight:600">fs/reiser4/super.h:379: error: previously used here</span></p>
<p><span style="font-weight:600">make[2]: *** [fs/reiser4/debug.o] Error 1</span></p>
<p><span style="font-weight:600">make[1]: *** [fs/reiser4] Error 2</span></p>
<p><span style="font-weight:600">make: *** [fs] Error 2</span></p>
<p></p>
<p>Here is the output from the gcc version:</p>
<p><span style="color:#8c8c8c">sena:/usr/src/linux#</span> <span style="font-weight:600">gcc -v</span></p>
<p><span style="font-weight:600">Reading specs from /usr/lib/gcc-lib/i486-linux-gnu/3.3.6/specs</span></p>
<p><span style="font-weight:600">Configured with: ../src/configure -v --enable-languages=c,c++,java,f77,pascal,objc,ada,treelang --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-gxx-include-dir=/usr/include/c++/3.3 --enable-shared --enable-__cxa_atexit --with-system-zlib --enable-nls --without-included-gettext --enable-clocale=gnu --enable-debug --enable-java-gc=boehm --enable-java-awt=xlib --enable-objc-gc i486-linux-gnu</span></p>
<p><span style="font-weight:600">Thread model: posix</span></p>
<p><span style="font-weight:600">gcc version 3.3.6 (Debian 1:3.3.6-7)</span></p>
<p></p>
<p>One more thing, i patched the 2.6.13 kernel (not the 2.6.13.1) and i got no compilation error. Thanks and best wishes...................yoanis</p>
<p></p>
</body></html>
--Boundary-00=_O8DWDwmu+6gw1uZ--

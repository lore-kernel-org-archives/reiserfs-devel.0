From: Guilherme Covolo <smyows@youare.not.br>
Subject: Re: reiser4 experimental patch
Date: Fri, 10 Nov 2006 09:57:05 -0200
Message-ID: <200611100957.05438.smyows@youare.not.br>
References: <200611091723.20881.smyows@youare.not.br> <1371.201.27.114.89.1163115557.squirrel@shaka.youare.not.br> <200611101244.47290.hirtejs@idmt.fraunhofer.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30131-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200611101244.47290.hirtejs@idmt.fraunhofer.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Em Sexta 10 Novembro 2006 09:44, Johannes Hirte escreveu:
> Am Freitag, 10. November 2006 00:39 schrieb smyows@youare.not.br:
> > thanks for answer! :)
> >
> > so, the patch compiles fine (one warning in super_ops.c), the FS boot
> > correctly, but if i execute for exemple startx, kernel panic! i compile
> > reiser4 built in with debug, i will send the error (kernel panic) to the
> > list tomorow because i'm now in my house, and the experinet is on my work
> > computer :)
>
> I didn't look closer on your patch, but you shouldn't get a warning in
> super_ops.c. Which compiler do you use?
> Can you try the patch, I've made?
> http://www.stud.tu-ilmenau.de/~johi-in/patch-reiser4-2.6.18.bz2

Hello, 

i use gcc 3.4.6 on slamd64 (www.slamd64.com), x86_64.

i will try your patch :) 

i'm on-line now on irc.oftc.net nick smyows #reiser4 and my nootebook is on 
kernel-2.6.18@my_experimental_reiser4_patch ... 

error from boot today..

reiser4 panicked cowaedly: reiser4[mount(1909)]: check_blocks_bitmap 
(fs/reiser4/plugin/space/bitmap.c:1268)[zam-623]: assertion failed: 
reiser4_find_next_zero_bit(bnode_working_data(bnode), end_offset, 
start_offset) >= end_offset

Kernel panic - not syncing: reiser4[mount(1909)]: check_blocks_bitmap 
(fs/reiser4/plugin/space/bitmap.c:1268)[zam-623]: assertion failed: 
reiser4_find_next_zero_bit(bnode_working_data(bnode), end_offset, 
start_offset) >= end_offset

... 

yesterday give some error but in /fs/reiser4/context.c line 79

i reboot the computer and works now.

i'll compare the super_ops.c :)

thaks

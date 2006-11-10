From: Johannes Hirte <hirtejs@idmt.fraunhofer.de>
Subject: Re: reiser4 experimental patch
Date: Fri, 10 Nov 2006 12:44:46 +0100
Message-ID: <200611101244.47290.hirtejs@idmt.fraunhofer.de>
References: <200611091723.20881.smyows@youare.not.br> <200611092300.kA9N0bbI002461@turing-police.cc.vt.edu> <1371.201.27.114.89.1163115557.squirrel@shaka.youare.not.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30130-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1371.201.27.114.89.1163115557.squirrel@shaka.youare.not.br>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: smyows@youare.not.br

Am Freitag, 10. November 2006 00:39 schrieb smyows@youare.not.br:
> thanks for answer! :)
>
> so, the patch compiles fine (one warning in super_ops.c), the FS boot
> correctly, but if i execute for exemple startx, kernel panic! i compile
> reiser4 built in with debug, i will send the error (kernel panic) to the
> list tomorow because i'm now in my house, and the experinet is on my work
> computer :)

I didn't look closer on your patch, but you shouldn't get a warning in 
super_ops.c. Which compiler do you use?
Can you try the patch, I've made?
http://www.stud.tu-ilmenau.de/~johi-in/patch-reiser4-2.6.18.bz2

From: "Jaroslav Fojtik" <jafojtik@seznam.cz>
Subject: Re4: Question about reiser performance - short system freezes
Date: Tue, 01 Mar 2011 22:00:23 +0100
Message-ID: <4D6D5E67.11412.144A223@jafojtik.seznam.cz>
References: <4D65A3F7.22052.1288FE@jafojtik.seznam.cz>, <4D6D0CE7.22102.64597@jafojtik.seznam.cz>, <4D6D220D.2020309@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-reply-to: <4D6D220D.2020309@gmail.com>
Content-description: Mail message body
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Dear Edward Shishkin,

> >> It might be a regression that have been fixed in the latest
> >> kernels. Consider upgrading to .37. If it doesn't disappear,
> >> then please send the SysRq-w output.
> >
> > sorry, I cannot test on 2.6.37.2 :(
> > reiser4 completely crashes kernel here.
> 
> 
> Please, make sure you build everything correctly.
> Also please avoid suffixed (37.x, etc) stuff: it
> can contain changes incompatible with reiser4.

I have used "reiser4-for-2.6.37.patch" against
"linux-2.6.37.2". I do not know what do you mean with 37.x?
You have asked me to upgrade ".37".

Patch has been downloaded from here:
http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/

  Everything worked fine until I started to copy files from one HDD
to second one. After 30min Linux crashed.

regards
   Jara



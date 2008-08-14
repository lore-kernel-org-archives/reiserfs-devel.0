From: Sascha Lucas <sascha_lucas@web.de>
Subject: files as directorys
Date: Thu, 14 Aug 2008 17:47:47 +0200
Message-ID: <200808141747.48141.sascha_lucas@web.de>
Reply-To: reiserfs-devel@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hi list,

I like to try the "files as directorys" plugin. Please tell me first if I 
understand it right, what this can do:

An often made example is /etc/passwd. If used with the "files as directorys" 
plugin then passwd is a directory and a file at the same time. You can chdir 
into passwd and have i.e. each line in a separate file. Legacy apps can still 
open passwd like a file as "normal"/before.

And now the question, why I can't verify this myself:

$ /sbin/mkfs.reiser4 -o create=dir40 reiser4.img
/sbin/mkfs.reiser4 1.0.6
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by 
reiser4progs/COPYING.

Overriding the plugin profile by "create=dir40".
Error: Can't override profile slot "create" by the found plugin "dir40": a 
plugin of the same type but of another group is found.

Any hints for me what I'm doing wrong? Distro is gentoo with: 
 - gentoo-sources-2.6.25 and reiser4-patch from kernel.org/edward
 - reiser4progs-1.0.6-r1 from gentoo-portage

TIA Sascha.

From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: mount throws a nikita-3228 on me
Date: Tue, 25 May 2004 11:00:01 +0300
Message-ID: <20040525080001.GF4990@nysv.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18840-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi

I took a snapshot from the Namesys BK some days ago, compiled the
2.6.6-mm2 with high hopes of the future, but it doesn't mount.

It says only small keys are supported. I think it was a Nikita-3228.[1]

Looking at the code, it seems like it checks which size of keys are
supported. AFAIK this is not an mkfs-time option, but a kernel option only?

What does it mean, is the BK kernel broken or must I work some magick
to get it working?

What does it mean when the kernel help says it will make my system
binary-incompatible? Just that it doesn't mount or will actual ELF
files break?

Why support two key sizes at all? Small keys save disk space but aren't
as cool? Is there some practical situation where one would not want
large keys?

I'm not the only one who has experienced this, but I haven't heard
anyone getting it to work, so any help would be much appreciated.

[1]
Whoever came up with this bug naming scheme deserves an award for
innovation, practice and cleanliness. If I ever get a project where
this may be applied, I will borrow the idea :)

-- 
mjt


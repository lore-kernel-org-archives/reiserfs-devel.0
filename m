From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: How can I list files with accessible inodes [/dev/sdb]
Date: Thu, 25 Aug 2016 15:12:55 -0700 (PDT)
Message-ID: <alpine.DEB.2.20.14.1608251507170.8131@trent.utfs.org>
References: <0529de4b5b9d00bff54fbf8403d9a6f5@mail.velocitynet.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <0529de4b5b9d00bff54fbf8403d9a6f5@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Fri, 19 Aug 2016, doiggl@velocitynet.com.au wrote:
> Reiser4 on /dev/sdb
> Can these  errors be fixed. 
> No luck in the past.
> I cannot access files which have ?????????? in ls listing or "No such file

As always: 

* Which kernel and what patches are you using? Does it happen on the 
  latest 4.7 vanilla kernel with Reiser4 patches on top? Was the
  file system accessible with older kernels?
* How is your Reiser4 file system mounted? (mount | grep reiser4)
* What lead to the errors in the first place? Was there a power outage,
  or some other crash?
* Does syslog show any underlying device errors? Please use a pastebin
  for longer syslog outputs.

C.
-- 
BOFH excuse #62:

need to wrap system in aluminum foil to fix problem

From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: Fwd: fsck.reiser4 questions
Date: Thu, 23 Jun 2016 15:21:40 -0700 (PDT)
Message-ID: <alpine.DEB.2.20.12.1606231501530.28615@trent.utfs.org>
References: <03c4d1e758ea1926333f6adff7ee75ba@mail.velocitynet.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <03c4d1e758ea1926333f6adff7ee75ba@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On Fri, 24 Jun 2016, doiggl@velocitynet.com.au wrote:
> Is fsck broken in version reiser4progs-1.1.0  ?
> What reiser4 checks and tests can I run on the the r4 meta data to see if
> it is  ok ? 
> Packed with 
> - I packed r4 meta-data with command
> # debugfs.reiser4 -P /dev/sdb  | gzip -9 > r4meta-sdb.gz

See debugfs.reiser4(8): once you've packed metadata, you can unpack it and 
write to a different device and use fsck.reiser4 on it. But...what are you 
trying to do?

> a copy of [reiser4 /dev/sdb] meta-data see:
> http://www.4shared.com/file/-RA17cXlba/metadata-sdb.html

I couldn't find the correct download button, the ones I clicked just 
brought up advertisments and fake flash installers :-\

> Background history
> ==================
> http://www.spinics.net/lists/reiserfs-devel/msg04206.html

Well, there you go: scroll down to the bottom to see Edward's response to 
your report.

Christian.
-- 
BOFH excuse #105:

UPS interrupted the server's power

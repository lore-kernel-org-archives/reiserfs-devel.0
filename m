From: <doiggl@velocitynet.com.au>
Subject: Re: Fwd: fsck.reiser4 questions
Date: Fri, 24 Jun 2016 17:51:52 +1000
Message-ID: <82ddbedfaee2bef953eef731b971445a@mail.velocitynet.com.au>
References: <03c4d1e758ea1926333f6adff7ee75ba@mail.velocitynet.com.au> <alpine.DEB.2.20.12.1606231501530.28615@trent.utfs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.12.1606231501530.28615@trent.utfs.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Kujau <lists@nerdbynature.de>
Cc: reiserfs-devel@vger.kernel.org

On Thu, 23 Jun 2016 15:21:40 -0700 (PDT), Christian Kujau
<lists@nerdbynature.de> wrote:
> On Fri, 24 Jun 2016, doiggl@velocitynet.com.au wrote:
>> Is fsck broken in version reiser4progs-1.1.0  ?
>> What reiser4 checks and tests can I run on the the r4 meta data to see
if
>> it is  ok ? 
>> Packed with 
>> - I packed r4 meta-data with command
>> # debugfs.reiser4 -P /dev/sdb  | gzip -9 > r4meta-sdb.gz
> 
> See debugfs.reiser4(8): once you've packed metadata, you can unpack it
and 
> write to a different device and use fsck.reiser4 on it. But...what are
you 
> trying to do?

> Christian.

Hello,
reiser4progs] fsck.reiser4 commands fail to repair file system [1] is the
reason I ask for this.

[1]

 --build-sb
 --build-fs 
 --fix

e.g
# fsck.reiser4 --build-sb --build-sb /dev/sdb
# fsck.reiser4 --build-fs --build-fs /dev/sdb
# fsck.reiser4 --fix  /dev/sdb

# fsck.reiser4 --fix --help
Usage: fsck.reiser4 [ options ] FILE
Fsck options:
  --check                       checks the consistency (default)
  --fix                         fixes minor corruptions
  --build-sb                    rebuilds the super block
  --build-fs                    rebuilds the filesystem
.
.
.


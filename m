From: Kristian Koehntopp <kris@koehntopp.de>
Subject: Strange directories after reisferfsck
Date: Tue, 4 Nov 2003 07:59:50 +0100
Message-ID: <20031104065949.GA11108@p15104972.pureserver.info>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15967-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Yesterday my / and /home crashed (Suse Linux 9.0 with reiserfs
for everything except /boot) due to problems with the Nvidia 8x
AGP driver. Reiserfs was able to recover / after a
--fix-fixable, but needed a rebuild for /home. I was able to
recover with almost no data loss and have disabled the Nvidia
driver since.

After the rebuild, I found lots of strange directories
obviously belonging to a / partition in my /home. Some theories,
which one is plausible:

- The memory corruption due to the AGP problems brought about 800
  MB worth of data down on /home during some erraneous sync (I
  have one GB of RAM).

- The /home partition holds lots of vmdk (VMware virtual disk
  files). reiserfsck looked through all blocks during the
  rebuild and interpreted contents of the vmdk files as valid
  leaf nodes, installing them into the /home proper instead.

- Part of the disk was used as a / a few years ago. (But the
  file dates I saw were not consistent with that, they were less
  than a month old).

What happened?

Kristian

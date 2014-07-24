From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Deleting a 5 GB directory in Reiser4 hangs system(s)
Date: Thu, 24 Jul 2014 04:24:01 -0700
Message-ID: <CAM12Q5RGOuEMyVhTPcVcLDGAri6H9-NbBKOF2T_PXfq0=kMVoQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Niltze!

I have a couple of root partitions with Debian which recently have
been default-formatted with Reiser4.

I have applied at the very least Mahoney's patch set (<
http://marc.info/?l=reiserfs-devel&r=1&b=201404&w=2 >) followed by
reiser4 for 3.14.1 patch (<
http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.x/
>) on kernels 3.14.4 and 3.15.2. Each kernel operates in a different
OS with reiser4 root fs.

Attempting to remove a ~ 5 GB directory recursively (rm -r) the
operation hangs either system.

Has the bug has been reported before? Or is it a feature ;-)

Cheers!

-- 
Jose R R
http://www.metztli-it.com
---------------------------------------------------------------------------------------------
NEW Apache OpenOffice 4.1.0! Download for GNU/Linux, Mac OS, Windows.
---------------------------------------------------------------------------------------------
Daylight Saving Time in USA & Canada ends: Sunday, November 02, 2014
---------------------------------------------------------------------------------------------

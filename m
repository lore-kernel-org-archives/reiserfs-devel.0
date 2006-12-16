From: "Christopher Covington" <covracer@gmail.com>
Subject: Rescue cds for fsck'ing reiser4?
Date: Sat, 16 Dec 2006 12:32:48 +0100
Message-ID: <dcdcb9a80612160332s138f62e3k3badde1d2e82c68@mail.gmail.com>
References: <194f62550612151028m1e006131w38d3f941e6e2e39e@mail.gmail.com>
	 <4582F0CB.6030703@namesys.com>
	 <194f62550612151221s648e80e8q570a7e1934adf3e1@mail.gmail.com>
	 <4583166D.60709@namesys.com>
	 <194f62550612151403h20e5de7x55bc2149f2a236b9@mail.gmail.com>
	 <dcdcb9a80612160332y7a0bc203p39679cbb031836ce@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30330-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <dcdcb9a80612160332y7a0bc203p39679cbb031836ce@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

When I was having different and obviously filesystem problems, booting
up with a reiser4-enabled livecd and rebuilding the tree fixed my fs.
This is of course only a very small piece of anecdotal evidence
regarding the reliability of fsck.reiser4's ability to fix the
filesystem.

Did you check dmesg for file access or write problems? That will tell
you if the problem is really the filesystem. The crashes could have
been due to other problems (on from-source distros, reverse
dependencies often need to be rebuilt to fix linking).

The CD I used was the Conrad
livecd--http://www.elfenbeinturm.cc/download/. SystemrescueCD also has
r4 support.

Chris

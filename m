From: Can Sar <csar@stanford.edu>
Subject: Reiser4progrs Compilation
Date: Thu, 3 Mar 2005 05:36:42 -0800
Message-ID: <29c041fd345080bf7dd7c0daf8b3389a@stanford.edu>
Mime-Version: 1.0 (Apple Message framework v619.2)
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

The "Getting started with Reiser4" page mentions that any reports about 
errors while installing Reiser4 should be sent to this list. I have 
successfully installed the correct kernel and libaal but run into 
problems with reiser4progs. I issue the following commands, which work 
fine until make.

tar zxf reiser4progs-1.0.4.tar.gz
cd  reiser4progs-1.0.4
./configure
make

Make complains that there is no Makefile. This is indeed true, the only 
Makefiles that were created by .configure are Makefile.in and 
Makefile.am. I tried cp-ing both of these to Makefile, but neither of 
them worked (as I had expected). I am running Ubuntu. I would be 
extremely grateful for any help you can provide. I've been fighting 
with this for hours but just can't get it to work.

Thank you very much for your help,
Can Sar


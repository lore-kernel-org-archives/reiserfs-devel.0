From: Mark Piper <mwp@cs.cmu.edu>
Subject: ReiserFS IFSD for Windows
Date: Thu, 12 May 2005 12:59:33 -0400
Message-ID: <42838B75.1000605@cs.cmu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24048-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

This summer, I will be starting a 3.5-month project to create an 
Installable File System Driver (IFSD) to read ReiserFS under Microsoft 
Windows, similar to ext2fsd.   (The project is a practicum to complete 
my degree in software engineering from  Carnegie Mellon.)

I have three questions:

* Is anyone out there interested in using the tool as it is developed?

* Is anyone out there interested in mentoring the development of the 
tool?  (This basically consists of answering specific technical 
questions when they arise.)

* Other than compliance to the GPL, are there any other liscensing 
factors I should be aware of?

For anyone interested, my initial plan is to port the read-only ReiserFS 
3 code from the GRUB bootloader, and turn it into an IFSD using the same 
techniques as in ext2fsd -- although I'd love to hear other ideas, and 
opinions of whether the project might be feasible with ReiserFS 4.

  Thanks,
     Mark Piper




From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: reiserfs logging patches udpated
Date: Tue, 30 Mar 2004 21:16:52 +0400
Message-ID: <16489.43908.702818.688887@laputa.namesys.com>
References: <1080149399.14737.77.camel@watt.suse.com>
	<20040324143516.3162cbfe.akpm@osdl.org>
	<1080168379.14743.124.camel@watt.suse.com>
	<200403250147.54246.bernd-schubert@web.de>
	<40625867.4060800@matchmail.com>
	<1080224062.26677.3.camel@watt.suse.com>
	<406343F1.2050504@matchmail.com>
	<1080247847.2926.0.camel@watt.suse.com>
	<4068203E.4050700@namesys.com>
	<40686FA2.1010501@matchmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17599-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40686FA2.1010501@matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: Hans Reiser <reiser@namesys.com>, Chris Mason <mason@suse.com>, Bernd Schubert <bernd-schubert@web.de>, reiserfs-list@namesys.com, Andrew Morton <akpm@osdl.org>

Mike Fedyk writes:

[...]

 > 
 > The basic idea of virtual vs block journals, is that instead of using a 
 > few bytes to describe what you're changing in (for instance) the inode 
 > table (or equivalent), ext3 (and reiser3 thanks to info from Chris 
 > Mason) copies entire inode table block (usually 1-4k depending on block 
 > size) into the journal.

Unless I am missing something this is called "logical logging" (as
opposed to the "physical logging") in the data-base literature.

Nikita.

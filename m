From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: mongo_copy: cp: cannot stat `/mnt/testfs/testdir0-0-0/f92': Input/output error
Date: Wed, 4 Aug 2004 13:02:04 +0300
Message-ID: <20040804100204.GM1284@nysv.org>
References: <20040804065840.17C7915C7C@mail03.powweb.com> <4110A0FA.3030007@namesys.com> <4110A38E.6070905@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19967-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4110A38E.6070905@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>, David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

On Wed, Aug 04, 2004 at 12:51:26PM +0400, Vladimir V. Saveliev wrote:

>Hans, should we solve this before sending reiser4 to Andrew?

I ain't Hans, but why not? :)

I also got an idea on the latest reiser4progs; Why not just make the
format change optional, or comment out the code that makes the format
change, if there were other good fixes?

Tell us where we are going before something bad happens, I don't want
to back up a hundred gigabytes of stuff in vain, even if I was always
prepared for it. (I have backups of only the stuff that REALLY matters..)

-- 
mjt


From: Chris Mason <mason@suse.com>
Subject: Re: Horrible ftruncate performance
Date: 04 Aug 2003 09:41:36 -0400
Message-ID: <1060004496.5877.179.camel@tiny.suse.com>
References: <20030710052931.GA17957@namesys.com>
	 <200307111716.56823.Dieter.Nuetzel@hamburg.de>
	 <20030711152431.GF17180@namesys.com> <200307111730.50601.m.c.p@gmx.net>
	 <20030711154415.GI17180@namesys.com>
	 <1057943343.13317.65.camel@tiny.suse.com>  <3F2D16A7.3060700@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15133-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F2D16A7.3060700@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, Marc-Christian Petersen <m.c.p@gmx.net>, Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, Szakacsits Szabolcs <szaka@sienet.hu>, reiserfs-list@namesys.com

On Sun, 2003-08-03 at 10:05, Hans Reiser wrote:

> I would like to see it go in more quickly.  I don't like significant 
> lags between distro and mainline kernels in principle, and in reiserfs I 
> would like to see the V3 code go mostly undisturbed after 2.4.22.  V3 
> needs to become zero defect, and only a lack of changes other than 
> bugfixes will make that happen.  Dribbling out changes slowly is not 
> conducive to being zero defect, and V3 only has a certain window of 
> usability anyway before V4 obsoletes it.
> 

v3 is installed on a large number of systems, and is storing a huge
amount of data.  It will not go away just because v4 is released.  The
v3 code will not be obsolete, it will still be heavy used and our users
will expect us to keep it up to date.

2.4.22 is pretty much frozen except for bug fixes, the rest of the data
logging code will have to wait for 2.4.23-pre

-chris



From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: Re: trouble with reiserfs on ppc vs-3050:
	wait_buffer_until_released ...
Date: 27 Apr 2003 00:46:53 +0200
Message-ID: <1051397193.1232.4.camel@localhost>
References: <1051258287.5564.1.camel@fortknox>
	 <1051259723.3513.7.camel@localhost> <20030425084742.GA22827@namesys.com>
	 <1051261556.3513.31.camel@localhost> <20030425091916.GG10802@namesys.com>
	 <1051263219.1642.10.camel@localhost> <20030425094630.GH10802@namesys.com>
	 <1051265575.1656.37.camel@localhost>  <20030425102812.GA24352@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13831-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030425102812.GA24352@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Fri, 2003-04-25 at 12:28, Oleg Drokin wrote:
> Ok, is this a new box? any chance to check if the memory is right?

ok, so I ran the memtest tool for a night without it finding any
errors... I did a full compare (not only md5sums) over network with the
files I have on disk... they were the same... I let bonnie run and
checked for corruption... nothing ... 

Looks like all I can do is keeping an eye on it.

Soeren.


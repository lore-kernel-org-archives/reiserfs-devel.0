From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Erased start of voulme...
Date: Fri, 14 Jan 2005 15:25:39 +0300
Message-ID: <20050114122539.GE5661@backtop.namesys.com>
References: <Pine.LNX.4.61.0501131658460.28732@holly.rdwarf.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23142-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0501131658460.28732@holly.rdwarf.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Louis Erickson <lerickson@rdwarf.net>
Cc: reiserfs-list@namesys.com

Hello,

On Thu, Jan 13, 2005 at 05:03:30PM -0800, Louis Erickson wrote:
> 
> I don't know how it happened, but the start of the /var partition of one 
> of the machines I run has gotten itself zeroed out.  Only the first little 
> bit - 4k or so - is nulls, then a large amount of very plausible data 
> appears.
> 
> I can't get reiserfsck to even think this is a reiserfs volume - the 
> program doesn't think this is a reiserfs volume any more.

> 
> Is there any chance of getting the data back off of this disk?  Can 
> reiserfsck be told to look harder and recover more deeply or something?  
> Or is this a lesson in why backups are important?
> 
> Any suggestions you can give are welcome.

reiserfsck --rebuild-sb can re-create the super block.

> I'm currently running dd from the mangled partition to a file to be able 
> to try some things without losing my only copy of the data.  If there's 
> anything special I have to do to make that work, please let me know.
> 
> Thank you!
> 
> -- 
> Louis Erickson - lerickson@rdwarf.net - http://www.rdwarf.com/~wwonko/
> 
> Oh Dad!  We're ALL Devo!

-- 
Alex.

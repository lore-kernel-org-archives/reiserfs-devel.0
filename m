From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Reiser4 bug?  Zeros in files.
Date: Wed, 3 Mar 2004 08:35:48 +0300
Message-ID: <20040303053548.GA1570@backtop.namesys.com>
References: <1078266036.12548.6.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17024-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1078266036.12548.6.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello,

On Tue, Mar 02, 2004 at 03:20:37PM -0700, Jonathan Briggs wrote:
> I'm using Reiser4 on MD RAID 0.  I'm seeing blocks of zeros in files. 

[ ... ]
 
> So, any ideas?  Things you'd like to know?  Things you'd like me to try?

What reiser4 snapshot are you using?  There were bugs related to md-devices
in the snapshots before 2004.02.25. 

> -- 
> Jonathan Briggs
> jbriggs@esoft.com

-- 
Alex.

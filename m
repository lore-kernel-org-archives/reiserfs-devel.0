From: Hans Reiser <reiser@namesys.com>
Subject: Re: Strange directories after reisferfsck
Date: Tue, 04 Nov 2003 18:32:11 -0800
Message-ID: <3FA8612B.3070809@namesys.com>
References: <20031104065949.GA11108@p15104972.pureserver.info> <200311041653.03841.vitaly@namesys.com> <20031105010827.GB13208@p15104972.pureserver.info> <3FA85B48.1050202@gmx.net> <20031105021644.GB32687@matchmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15975-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031105021644.GB32687@matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, Kristian Koehntopp <kris@koehntopp.de>, ReiserFS List <reiserfs-list@namesys.com>

Mike Fedyk wrote:

>
>
>Does that mean there is no generation number, or random hash in the 3.6
>format, or anything else that changes on each fs image that could be keyed
>upon?
>
>
>  
>
Right.  The V3 kernel code was written before we had experience with 
running fsck for real.  We learn.  We get older.  We release new 
versions.;-)

-- 
Hans



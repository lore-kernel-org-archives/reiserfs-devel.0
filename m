From: Cami <camis@mweb.co.za>
Subject: Re: secure delete?
Date: Fri, 19 Mar 2004 13:01:46 +0200
Message-ID: <405AD31A.7070304@mweb.co.za>
References: <1079691239.5767.7.camel@pear.st-and.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17312-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1079691239.5767.7.camel@pear.st-and.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

> Is there a way to securely delete a file or directory in ReiserFS or
> Reiser4? By "securely delete" I mean the kind of thing one of the PGP
> tools tries to do (i.e. overwrite the disk area with random bits several
> times). Of course this only works if the information is not moved around
> physically a lot (i.e. at all). Could secure delete work? Peter

srm will do the trick (securerm)..

Cami

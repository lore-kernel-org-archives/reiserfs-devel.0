From: Grant Miner <mine0057@mrs.umn.edu>
Subject: Re: "Metas"
Date: Wed, 21 Apr 2004 12:14:16 -0500
Message-ID: <4086ABE8.4090806@mrs.umn.edu>
References: <408045B8.7000102@mrs.umn.edu> <20040418033328.24278.qmail@web25006.mail.ukl.yahoo.com> <c5t3lg$g9g$1@satsuki.furryterror.org> <40869EAD.9020806@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18130-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40869EAD.9020806@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Hans Reiser wrote:

> so if rename works on metas, are you guys happy?  that is, if mv 
> filename/metas filename/... works, are you less worried about the one in 
> 10 million users who will actually hit the reserved keyword?
> 

That sounds like the best solution to the rare case where you would need 
to use a file named "metas".

But...what about the UNIX security issues where files that aren't 
executable can't have their "metas" accessed?  I suppose that will 
require extensive VFS changes and coordination with Al Viro?

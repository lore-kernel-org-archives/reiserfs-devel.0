From: "David Dabbs" <david@dabbs.net>
Subject: RE: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Tue, 10 Aug 2004 17:05:15 -0500
Message-ID: <20040810221319.F1A0D15C0D@mail03.powweb.com>
References: <411944EF.7000504@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20163-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <411944EF.7000504@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Hans Reiser' <reiser@namesys.com>
Cc: 'Alex Zarochentsev' <zam@namesys.com>, 'ReiserFS List' <reiserfs-list@namesys.com>



> -----Original Message-----
> From: Hans Reiser [mailto:reiser@namesys.com]
> Sent: Tuesday, August 10, 2004 4:58 PM
> To: David Dabbs
> Cc: 'Alex Zarochentsev'
> Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output
> error"
> 
> Do you report the time spent on wait as a separate metric or?
> 
> Hans
> 

No, there is nothing like that now and it didn't occur to me. Alex's earlier
message proposed timing the umount, but nothing regarding the wait. There is
(an undoc?) mongo option for EXTENDED_STATISTICS, but I think that strictly
deals with disk fragmentation.

david


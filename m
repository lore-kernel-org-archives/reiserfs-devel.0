From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: Proposal for keying encrypted filesystem
Date: Mon, 31 Mar 2003 15:36:18 +0200
Message-ID: <20030331133618.GO8452@hvs.envisage.co.za>
References: <200303282026.23543.phma@webjockey.net> <200303291155.40419.phma@webjockey.net> <3E85E338.CEAA7DC7@namesys.com> <200303301130.24136.phma@webjockey.net> <3E8824B4.55C63A55@namesys.com> <3E88300C.22B54FD7@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13484-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E88300C.22B54FD7@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shushkin <edward@namesys.com>
Cc: reiserfs-list@namesys.com

On Mon, Mar 31, 2003 at 04:09:48PM +0400, Edward Shushkin wrote:
> > > There isn't any guarantee with all 20 either,
> > 
> > Yes of course, but with all the 20 bytes I have a guarantee of SHA1 stability
> > announced in appropriate papers, and I do have nothing for 19 bytes..
> 
> So from this standpoint I would rather prefer 16-byte ID created by full-grade md5,
> then 19-byte ID created by restricted SHA1. Maybe this standpoint is too conservative, 
> but this is right.. 

The question that should be answered:

 Are the design suppose to withstand scrutiny from people like the NSA
and other crypto gurus, or just for the mom-a-pop-shops ? 




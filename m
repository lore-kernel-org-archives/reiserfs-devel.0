From: Hans Reiser <reiser@namesys.com>
Subject: Re: some testing questions
Date: Tue, 15 Aug 2006 15:03:52 -0700
Message-ID: <44E244C8.3040005@namesys.com>
References: <44DCC20C.7020400@email.si> <200608141615.58185.vs@namesys.com> <20060815142140.GA4247@kruemel> <44E228B7.10505@namesys.com> <44E2422F.8090708@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29603-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44E2422F.8090708@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Ingo Bormuth <ibormuth@efil.de>, reiserfs-list@namesys.com

David Masover wrote:
>  that's 3-7% fragmentation.  
which is high enough to hurt performance..... 50mb/s * 0.01 seconds =
amount of transfer a seek costs.  He needs a repacker.  After we resolve
code review issues from akpm.....

From: Oleg Drokin <green@namesys.com>
Subject: Re: Red Hat Enterprise Linux AS (v. 2.1) and  > 2 GB files
Date: Fri, 27 Jun 2003 10:59:18 +0400
Message-ID: <20030627065918.GA20771@namesys.com>
References: <1056635615.1967.377.camel@atlas.vinterbro.com> <20030626155842.2c7fd748.pegasus@nerv.eu.org> <3EFB1F97.3020205@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14722-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EFB1F97.3020205@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Jure Pecar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

Hello!

On Thu, Jun 26, 2003 at 08:30:15PM +0400, Hans Reiser wrote:

> >Because RedHat never bothered to update reiserfs code in their e kernels.
> >Your best bet is to get a newer kernel, perhaps 2.4.21, and if you cannot
> >afford that, trim your app to not create files that big.
> >There are rumors that 2.4.18 based e kernel is in the testing ... 
> You mean RedHat is STILL shipping 2.4.9 based kernels?  Oh no wonder 
> there are people with stability problems.....

No, I believe there was kernel update last month that upgraded RHAS kernel up to
2.4.18.
Anyway RHAS 2.4.9 kernel does not have that much in common with vanilla 2.4.9.

Bye,
    Oleg

From: Lexington Luthor <lexington.luthor@gmail.com>
Subject: Re: Reiser4 in 2.6.14-rc1-mm1
Date: Fri, 16 Sep 2005 15:20:59 +0100
Message-ID: <dgekcf$ol3$1@sea.gmane.org>
References: <dge8vb$j9n$2@sea.gmane.org> <432ACB57.5070006@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25991-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <432ACB57.5070006@namesys.com>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Edward Shishkin wrote:
> Hello.
> It was possible earlier to set it per directory using pseudo-file 
> interface,
> but 2.6.14-rc1-mm1 does not contain it already. We will try to post and
> update the appropriate patch, but anyway using cryptcompress plugin
> can crash your system.
> 

How stable is it? Last I read, namesys was aiming to have the compress 
plugin working in reiser4 to be merged into 2.6.14 for the vanilla 
kernel release. Not that that matters, as I use -mm mostly on my test 
machines.

If it is possible to use it now, I would love to try - I don't mind 
crashes on my test boxes and having ~50% more space would be great :)

Regards,
LL


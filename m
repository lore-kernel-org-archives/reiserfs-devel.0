From: Jure Pecar <pegasus@nerv.eu.org>
Subject: Re: Red Hat Enterprise Linux AS (v. 2.1) and  > 2 GB files
Date: Thu, 26 Jun 2003 15:58:42 +0200
Message-ID: <20030626155842.2c7fd748.pegasus@nerv.eu.org>
References: <1056635615.1967.377.camel@atlas.vinterbro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14714-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1056635615.1967.377.camel@atlas.vinterbro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On 26 Jun 2003 15:53:35 +0200
Trond Hagen <trond@vinterbro.com> wrote:

> Hi !
> 
> I'm have problems with creating files bigger than 2GB on a 3.6 reiserfs.
> 
> Why ?
> 
> Spec:
> 2.4.9-e.24enterprise
> ReiserFS version 3.6.25 [as module]

Because RedHat never bothered to update reiserfs code in their e kernels.
Your best bet is to get a newer kernel, perhaps 2.4.21, and if you cannot
afford that, trim your app to not create files that big.

There are rumors that 2.4.18 based e kernel is in the testing ... 

--

Jure Pecar

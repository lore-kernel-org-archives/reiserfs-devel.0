From: Chris Mason <mason@suse.com>
Subject: Re: no reiserfs quota in 2.4 yet? 2.4.21-pre4-ac4 says different
Date: 17 Feb 2003 12:55:27 -0500
Message-ID: <1045504527.2182.415.camel@tiny.suse.com>
References: <20030217183957.O1284@humilis>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12791-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030217183957.O1284@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ookhoi@humilis.net
Cc: reiserfs-list@namesys.com, alan@lxorguk.ukuu.org.uk

On Mon, 2003-02-17 at 12:39, Ookhoi wrote:
> Hi Reiserfs team,
> 
> Today I put a new kernel on a server which has reiserfs and needs quota.
> I searched for the quota patches (found them in the mail archive) and
> saw that they are very old:
> 
> ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing/quota-2.4.20
> 
> 3 december 2002. They don't apply to a current kernel. 
> 

Well, 2.4.20 is the current kernel ;-)  Which kernel do you want them
against?  I've got patches against 2.4.21-preX in testing here, but not
against -ac.  They should merge against -ac now more easily, but I
haven't had time to really test it.

Do you want to try the merge on -ac or would you rather try against
2.4.21-preX

-chris




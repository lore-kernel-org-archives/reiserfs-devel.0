From: Oleg Drokin <green@namesys.com>
Subject: Re: quota setting, 2.4.19
Date: Thu, 6 Feb 2003 10:26:14 +0300
Message-ID: <20030206102614.A6873@namesys.com>
References: <DOEAIECOOBNKAOBJPKEOCEEIFJAA.kolodez@paradigma.ru>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12658-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <DOEAIECOOBNKAOBJPKEOCEEIFJAA.kolodez@paradigma.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Serge Kolodeznyh <kolodez@paradigma.ru>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Feb 05, 2003 at 11:47:43PM +0300, Serge Kolodeznyh wrote:
> What commands in what order I must use for setup quota on reiser-fs volume ?
> What files I must create - aquota.* or quota.* at root of volume ?
> kernel quota patches was maked ok and are loaded ok, also I'v installed
> quota-tools 3.08.
> I can't find adequate working info or faq on the web.. :-(

There is Quota-HOWTO with more explanations.
You need to run quotacheck -cug /mountpoint
/mountpoint should be mounted with necessary quota mount options.

Bye,
    Oleg

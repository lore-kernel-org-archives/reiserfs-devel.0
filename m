From: Vince <fuzzy77@free.fr>
Subject: Re: Linux 2.4 -> 2.6 migration
Date: Fri, 07 Nov 2003 18:10:57 +0100
Message-ID: <3FABD221.2010805@free.fr>
References: <m3ptg42t8l.fsf@toyland.sauerland.de> <3FABA80A.1090608@gmx.net> <m3k76c9m5a.fsf@toyland.sauerland.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16010-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3k76c9m5a.fsf@toyland.sauerland.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Sebastian Kaps wrote:

> 
> The problem is not that newly written data is lost but that files
> suddenly have contents that belong to other files. I could live with the
> loss of unsaved data but for example I hate it when my window manager
> configuration is wrecked because contents that would belong to
> /var/log/messages appear in its config files. I've never had this with
> ext2 but quite a few times with ReiserFS.

Same here, and I couldn't agree more. I've had several bad corruption in 
my config files and logs happening because of this particular - and way 
too common - reiserfs behaviour...   :-/

>>If you want your data to be consistent in such cases you need to apply
>>Chris Mason's data logging patches, or use the SuSE Linux kernel.
>>See http://ftp.suse.com/pub/people/mason

On the same topic : does anybody know if there is a 2.6 version of these 
patches available somewhere ? (or else if a 2.6 port of those is planned 
in the short term ?)

Vincent


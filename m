From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4 in 2.6.14 - lockups with mmapped files
Date: Tue, 15 Nov 2005 11:12:19 +0300
Message-ID: <43799863.2030102@namesys.com>
References: <1130860221.12859.23.camel@laptop> <436796F6.10603@namesys.com> <1131028204.13284.29.camel@laptop> <436A706E.2010001@free.fr> <436B8A10.3000400@namesys.com> <436BB8AF.9020103@free.fr> <20051112015840.GA28777@148.Red-217-126-33.pooles.rima-tde.net.>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26942-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051112015840.GA28777@148.Red-217-126-33.pooles.rima-tde.net.>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rvalles <rvalles@es.gnu.org>
Cc: reiserfs-list@namesys.com

Hello

rvalles wrote:
> Still having the same problem, with 2.6.14.2 patched with 2.6.14-1
> reiser4 patch.
> 
> It's easy to trigger it while editing a file with vim, and it does take
> a hell of a long wait (while it hits the disk for a minute or so,
> sometimes) for it to unlock.

I notice this behaviour some times. But it does not appear to happen very often.
If you know the way to reproduce it on demand - would  you please share your
knowledge?

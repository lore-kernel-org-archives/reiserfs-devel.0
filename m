From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: 2.4.20, reiserfs, md linear, and "Permission denied"...
Date: 13 Jan 2003 19:37:53 -0500
Message-ID: <avvm51$3ae$1@satsuki.furryterror.org>
References: <avprcs$bfi$1@satsuki.furryterror.org>
Return-path: <reiserfs-list-return-12326-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <avprcs$bfi$1@satsuki.furryterror.org>,
Zygo Blaxell <eazgwmir@umail.furryterror.org> wrote:
>I think I'm seeing a pattern of failure.  I'm wondering if there is a
>problem with MD linear personality (aka JBOD) and reiserfs.

This has just now happened to a machine running a RAID0 array.  There
was no unclean shutdown this time.  That seems to rule out linear mode
as a possible culprit (although MD might have a bug that affects both
RAID0 and linear).

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD

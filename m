From: "Xu CanHao" <xucanhao@gmail.com>
Subject: Re: Filesystem corruption
Date: Wed, 6 Jun 2007 11:10:45 +0800
Message-ID: <6ec7a4340706052010r55ad07b5yc966f63622a443ae@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30687-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        b=U9+CazKOz9YjEVJdUvuQtVXftdPDPViQtS+y2JjtZAUyH55D+hFGv35/bSgGjyU5DzP7OEs7Z8OsGJGvW2N9T/bCApQ8V6iEJRjUcR/09Hw+CXPkhoVffPy+9S5Zjv4vy+lRrmSVtfShJmpkTgQ0x4+EIv1F9c1fOcladGzxYMg=
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

So maybe I'd suggest anybody take the _official_ reiser4 patch-set and
_vanilla_ kernel source, these things should provide the maximum
stability. My root filesystem with reiser4 never loses data.

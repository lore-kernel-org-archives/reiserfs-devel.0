From: Radim Kolar <hsn@cybermail.net>
Subject: Re: problems with /var/lib/dpkg/info
Date: Sun, 11 Aug 2002 10:17:43 +0200
Message-ID: <20020811081742.GA7672@home>
References: <20020810090529.GA411@home> <20020810133256.A1897@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11159-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020810133256.A1897@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

> reiserfs have no problems with large directories generally speaking.
> What are the problems you are experience?
inaccessible files (shown in directory but can not be read). In some
cases both source and rdisted copy was corrupted on the same files.
I am now using tar+gz for backup instead rdist :)

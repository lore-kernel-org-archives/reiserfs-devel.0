From: Jan Kara <jack@ucw.cz>
Subject: Re: reiser4 not supporting quota
Date: Tue, 5 Apr 2005 12:37:32 +0200
Message-ID: <20050405103726.GA26711@atrey.karlin.mff.cuni.cz>
References: <75a6e5ba0504050008427613d2@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23779-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <75a6e5ba0504050008427613d2@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dudi Indrasetiadi <dudi.indrasetiadi@gmail.com>
Cc: reiserfs-list@namesys.com

> Sorry for this ``not so smart'' question, is there quota support in
> reiser4? Or quota is not in the main idea of reiser4?
  There is not quota support for Reiser4. I'm looking into it but first
I have to come up with a reasonable semantics + idea of efficient
implementation :) The framework of plugins and the fact that Reiser4 first
overestimates the needed space and then releases it (and eventually
uses also some of the "reserved" space) makes the quota implementation harder
than in other filesystems...

								Honza

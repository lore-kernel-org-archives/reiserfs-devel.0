From: Oleg Drokin <green@namesys.com>
Subject: Re: 3.5.34: reiserfs_file_write: item has been moved
Date: Wed, 14 Aug 2002 12:50:02 +0400
Message-ID: <20020814125002.A28182@namesys.com>
References: <wvu1ly56sc.fsf@freeze.oslo.dnmi.no>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11184-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <wvu1ly56sc.fsf@freeze.oslo.dnmi.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Phillips <a.phillips@met.no>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Aug 14, 2002 at 07:49:23AM +0200, Adrian Phillips wrote:

> I have got the following error 4 times in the space of about a week :-
> reiserfs_file_write: item has been moved while we were in copy_from_user (appending to the direct item)
> Should I be worried ? :-)

This is not an error, but just a informational message instead.
You should not be worried at all.

Bye,
    Oleg

From: "Chris Witham" <chris@witham.com>
Subject: Re: icheck and ncheck on ReiserFS to convert bad sector numbers to filenames
Date: Tue, 3 Oct 2006 09:51:11 -0400
Message-ID: <60509cfa0610030651j65e94b39w3f06a1606863e555@mail.gmail.com>
References: <60509cfa0609281651v5553d879jd65b8e6d6041b14c@mail.gmail.com>
	 <451C7099.4050708@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29994-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: christopher.witham@gmail.com
In-Reply-To: <451C7099.4050708@suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-list@namesys.com

On 28/09/06, Jeff Mahoney <jeffm@suse.com> wrote:
>
> I'm afraid the icheck/ncheck way of doing things isn't much less
> brute-force, it's just hidden from you. You could do what you're looking
> for with a perl script that parses the debugreiserfs output.

 I ended up using the brute-force 'find' to scan the failing HD, and
it only identified 3 unimportant files as corrupt.  I restored the
files from the disk image, deleted the 3 bad files, and everything
seems to be OK from there.

 Thanks for the help!


Chris

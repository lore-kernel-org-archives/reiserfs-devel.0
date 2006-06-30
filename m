From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: debugreiserfs -p contains sensitive information?
Date: Fri, 30 Jun 2006 14:04:05 +0400
Message-ID: <1151661845.6499.39.camel@tribesman.namesys.com>
References: <44A4430C.1090106@hanaden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28871-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44A4430C.1090106@hanaden.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: hanasaki <hanasaki@hanaden.com>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2006-06-29 at 16:15 -0500, hanasaki wrote:
> debugreiserfs -p contains sensitive information?
> 
> could someone from the Reiser development / design team confirm if the
> above command outputs any sensitive information?  for example: part or
> all of a file on the filesystem?  Just what is in the output?  Looking
> for more details than are in the man page.
> 

debugreiserfs -p extracts metadata from a filesystem. Most of data are
binary. Contents of files are not extracted. The only information which
is extracted and can be considered sensitive is filenames.

Having those metadata allows (usually) to reproduce reiserfsck bugs
without having whole filesystem.


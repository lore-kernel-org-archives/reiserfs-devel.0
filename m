From: Ross Jekel <ross@sourcelabs.com>
Subject: Reiser4 & Files/Directories question
Date: Thu, 08 Sep 2005 11:43:32 -0700
Message-ID: <43208654.7040502@sourcelabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25900-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Newbie question as I'm evaluating Reiser4 as a storage solution for a 
project I'm working on.

It appears Reiser4 has the ability to have a file name be both the name 
for the file data and a directory. Can I take advantage of this at the 
application level?

For instance, can I use python to access the file data directly, and 
access the directory information as well to open any attribute files I 
might want to put in there? Or is that functionality only available 
through non-posix calls from file system plugins and such.

I was interested in the design of the livingxml.net solution from the 
testimonials page, but that site is no longer available. Is there a 
project or design document somewhere that summarizes the best way of 
using reiser4 as a database of content with additional metadata for each 
document?

Forgive me if this is answered somewhere. I've searched some mailing 
list archives site and couldn't find the exact answer.

Thanks,
Ross

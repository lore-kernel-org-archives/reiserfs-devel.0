From: Yoanis Gil Delgado <fred@lab.matcom.uh.cu>
Subject: Authoring a versioning plugin
Date: Wed, 11 Jan 2006 17:59:14 -0500
Message-ID: <200601111759.14638.fred@lab.matcom.uh.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27670-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-List@namesys.com

This are the intentions:
To write a versioning plugin that will allows the file system user to easily 
revert the files under versioning to a some previous state.  The plugin will 
allow to revert the file state, based on revisions number and date 
modifications(and not sure about this one). There will be a special pseudo 
file named "previous" that will return the previous version of the file. The 
final result should allow to the the following actions:

$ echo 1 > myfile.txt  (let's say we make this command at Wed Jan 11 16:53:55)
$ echo 2 > myfile.txt  (let's say we make this command at Wed Jan 11 16:54:57)
$ echo 3 >> myfile.txt (let's say we make this command at Wed Jan 11 16:55:59)

Suppose you want the latest version, then you type:
$ cat myfile/.../previous
 Some other content
Or you want the n-th version, then you type:
$ cat myfile/.../1
 Some content 
$ cat myfile/.../2
 Some other content
$ cat myfile/.../3
 Some other content
 Some more content
$
Or the version nearest to some date, then you type:
$ cat myfile.txt/.../Wed\ Jan\ 11\ 16:50
 Some other content

Also , there will be an special attribute named under_versioning(or something 
like that), that will tell if the file is under versioning. This plugin will 
not track directories version, although it's a future plan(I think this 
should be mixed with some undelete plugin).  

I'm planning to use a delta techniques for versioning storage (delta 
compression). The versioning will be at the write level. The versions will be 
saved in a special directory under the filesystem. I think the hard part is 
the one related to detecting the changes (a COW it's a possible solution, but 
i think it's to expensive). I'm thinking a possible solution will be 
detecting the bytes changing in each write and archiving then as the 
difference.  This introduce some problems like :
1-) What happens if the file shrinks?
2-) What happens if the file grows ?

I will send another email with a solution to this problems.

I've also plans to extent the documentantion of plugins creation in reiser4 
with the experiences of this project. I'll be working in this plugin for more 
than 4 months. If you're interested you're welcome to the the team(just me 
right now :D )


Well....... I think this is all (for now  :D ). Please let me know what you 
think.





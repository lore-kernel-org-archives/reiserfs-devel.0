From: Guido Schimmels <guido.schimmels@freenet.de>
Subject: Will Reiser4 support a "hidden" attribute?
Date: Thu, 20 Nov 2003 01:58:44 +0100
Message-ID: <20031120005844.GC8854@Benine>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-16127-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: reiserfs-list@namesys.com

I would like to have some clarification about this section from  
namesys.com:

"Hidden Directory Entries

A file can exist but not be visible when using readdir in the usual  
way. WAFL does this with the .snapshots directory; it works well for  
them without disturbing users. This is useful for adding access to a  
variety of new features and their applications without disturbing the  
user when they are not relevant."

This paragraph has been drastically pruned since the last time I was  
reading it. Back then it went ahead asking if people wanted hidden  
files like fat, ntfs and HFS always had. From the way this section has  
been shortened I take it, this feature has indeed found its way into  
Reiser4? This would be fantastic! I'm planning to use Reiser4 for my  
Desktop Linux project. I need this feature to hide the Unix legacy tree  
like MacOS X does it and (back then) BeOS.

What would be the command to hide/unhide a file?

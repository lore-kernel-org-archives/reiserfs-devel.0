From: "Faraz Ahmed" <farazs@calsoftinc.com>
Subject: RE: File as a directory - VFS Changes
Date: Thu, 2 Jun 2005 07:46:52 -0700
Message-ID: <008801c56781$eaf2ccf0$5f0010ac@screech>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24284-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

 Hi Nikita;


     The problems of files not fitting in the query of the smart folder is a
 serious one. We had implemented this same thing for our semantic
filesystem.

For ex we create a MP3 file is a JPEG folder things it wont ever get
listed.
This will fundamentally change the way users see your filesytem, the users
expect to see the files in the folder they created. This it self should be a
default search criteria.
We almost solved this by having the "parentdirectory" as a attribute of the
file. All the smart folders have thier query transparently modified as
"where type=jpg Or parentdirectory=thisdirectory". This make the virtual
folder stuff work as EXTENSION to standard file/directory relationship
rather than work as RELPLACEMENT.

    Personal experience says that user dont digest any change to UNIX
filesystem mode. Anything extra is OK but replacements are BAD. Think of it
you created a C file in a virtual folder for "h" files the files wont get
listed(althoug they will exist). THEN WHAT??? the user has to search it BAD,
your whole fancy virtual directory USECASE itself is lost and eventually we
endup solving nothing.



    Other issues include this display name stuff etc. They are bad. what if
two files with same display name get listed in the same virtual directory.
No point in creating a problem and then solving it. Good Work though we dont
want to get booged down once WinFS is released.
Regards
Faraz.



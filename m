From: faraz ahmed <faraz_irulz@yahoo.com>
Subject: ReConfigurable Directory Structure & Agrregation of files according to semantic.
Date: Tue, 16 Mar 2004 14:45:23 -0800 (PST)
Message-ID: <20040316224523.39093.qmail@web60408.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17255-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: reiserfs-list@namesys.com

Hi EveryBody;
Iam an final year engneering student and as part of
our final year project we have implemented a
filesysten which =20
support more than 1 Directory Structures for the same
set of files. Each Directory Structure is a XML file
discribing the directory structure as well as the
attributes of the Files to be listed under Each
directory. The file system the mounts this XML file &
produces the directory listing by querying the FS for
files which match the criteria. The Project will soon
be made public under GPL. Following is the abstract.
Please guide me with your valuable suggestions.


//=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1. Idea of our project:
//=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The aim of this project is to implement a solution
that provides file-level host-based virtualization
that provides for better aggregation of
content/information based on semantics and properties.
File-system organization today very closely mirrors
storage paradigms rather than user-access paradigms
and semantic grouping. All file-system hierarchies are
containers that are expressed based on their physical
presence (a separate drive letter on Windows, or a
particular mount point based on the volume in Unix).=20
We wish to implement a solution that will allow users
to organize their files based on their convenience. We
define this convenience in the following forms:=20

The ability to organize the namespace based on certain
attribute properties (file-system metadata
virtualization).=20
Ex Directory Listing as an output of high level
relational query based on file attributes.

The ability to de-link position of a file in the
hierarchy from its actual storage (file metadata
virtualization)=20
Ex Directory Listing as an output of high level
relational query based on file attributes.

The ability to de-link position of a file in the
hierarchy from its actual storage (file metadata
virtualization)=20
Ex Automatically Listing the files with the proper
attributes in the respective directories. Create &
forget file system now puts your MP3 file in the right
folder no matter where they are stored on the disk.

The ability to create and manipulate namespaces using
well-known metaphors (XML schema descriptions and
schema editors)=20
Ex. Define the directory structure with directory
query as an XML file. Mount multiple such directory
structures (virtualization). There by allowing
multiple organizational views for the same set of
files.

The ability to continue using the standard metaphors
for manipulation and access to information
(file-system kernel API=92s), thus maintaining current
large body of applications unbroken) .
Ex. Make all this features available as an standard
file system so existing apps wont fail

__________________________________
Do you Yahoo!?
Yahoo! Mail - More reliable, more storage, less spam
http://mail.yahoo.com

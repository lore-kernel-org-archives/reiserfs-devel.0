From: Eddie Atherton <stunnel@attglobal.net>
Subject: Question about system lock-ups
Date: Fri, 04 Jan 2008 19:36:33 -0800
Message-ID: <477EFB41.4070600@attglobal.net>
Reply-To: stunnel@attglobal.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Hi,

I don't think this issue is reiser related, but I thought I'd bounce it 
here, in case anyone might be able to shed light on it, based on the 
symptoms.

Yesterday, for the 3nd time, my system "kind of" locked up. Each time 
this has happened, it's been after around a month of up-time, and all 
times were at odd hours, so the system wasn't being used much, so I 
don't think it's temperature related, otherwise I'd get them during the 
day, when I am using the system heavily.

OK, the symptoms are this. On the monitor I can see my screensaver, 
<http://www.linuxquestions.org/questions/#>but it's not "in motion". The 
keyboard and mouse don't work. I can't connect by ssh or VNC, 
<http://www.linuxquestions.org/questions/#> but neither actually time 
out, they just hang. Requests to DHCP hang. BUT, the system is still 
running, because it acts as a server/gateway for the rest of the 
machines in the house, and they can connect to the internet 
<http://www.linuxquestions.org/questions/#>without problems. I can surf 
the web, I can send and receive e-mails, anything but connect directly 
to the server. <http://www.linuxquestions.org/questions/#>

The only way to get the system to respond, is the "big red button". On 
restart, and here's why I'm trying this list for ideas, is that I 
noticed, again each time, is hundreds and hundreds, if not thousands of 
messages showing reiser replaying transactions. It takes, sometimes, 
nearly 5 minutes for this to complete.  What kind of issue could cause 
all of these transactions to be replayed.

Examining the logs doesn't show anything, except that all logging 
appears to stop at the same point in time, which I think is when the 
"issue", whatever it is, occurs, because the time was around 4 hours 
before I noticed the lock-up.

thought about a drive issue, but smartd isn't reporting any problems, 
normally, or via short/long self-tests. Plus, I'd expect some "failure" 
messages at some point, not just a lock-up.

Lastly, here's the only relevant message I could find in dmesg, from the 
resultant boot:

ReiserFS: hda2: checking transaction log (hda2)
ReiserFS: hda2: replayed 1125 transactions in 67 seconds

Now, here's the really weird part.  hda2 is an UNUSED partition.  It 
isn't mounted on the system:

Filesystem            Size  Used Avail Use% Mounted on
/dev/hda1             9.3G  3.5G  5.9G  37% /
/dev/hdb2             187G  164G   24G  88% /usr/local/NotYet
/dev/hdb3              47G   18G   30G  37% /usr/local/Apps
/dev/sda5             233G  140G   93G  61% /usr/local/Music
/dev/sda6             233G  173G   60G  75% /usr/local/Backup
tmpfs                 256M   68K  256M   1% /tmp

Any thoughts on what might be causing this, and more importantly, how to 
track down the culprit.

Cheers,
Eddie


#!/usr/bin/perl
print "Content-type: text/html\n\n";
print "<html>\n";
print "<head>\n";
print "<title>inMobi Subversion<\/title>\n";
print "<\/head>\n";
print "<body>\n";
print "<img src=\/inmobi_logo.png>\n";
print"<H1>SVN Home</H1>\n";

print "<Font size=+2><b>Navigate to a repository</b></font></br><br>\n";
print "<table border=0>";
print "<tr>";
print "<td colspan=4><Font size=+1><b>inMobi Repositories</b></font></td></tr>\n";
  opendir(DIRHANDLE, "/opt/svnroot/inmobi") || die "Cannot opendir /opt/svnroot/inmobi: $!";
  $colnum=1;
  foreach $name (sort readdir(DIRHANDLE)) {
    if($name =~ /^\./) { 
       next;
    } else {
       if ($colnum==4) {$colnum=1;}
       print "<TR>\n" if $colnum==1;
       print "<TD><A HREF=\"$svnhost/inmobi/$name\">$name</A></TD>\n";
       print "</TR>\n" if $colnum==3;
       $colnum++;
    }
  }

#print "<tr><TD>&nbsp</td></tr>";
#print "<td colspan=4><Font size=+1><b>Other Repositories</b></font></td></tr>\n";
#  opendir(DIRHANDLE, "/opt/svnroot/others") || die "Cannot opendir /opt/svnroot/others: $!";
#  $colnum=1;
#  foreach $name (sort readdir(DIRHANDLE)) {
#    if($name =~ /^\./) { 
#       next;
#    } else {
#       if ($colnum==4) {$colnum=1;}
#       print "<TR>\n" if $colnum==1;
#       print "<TD><A HREF=\"$svnhost/others/$name\">$name</A></TD>\n";
#       print "</TR>\n" if $colnum==3;
#       $colnum++;
#    }
#  }

print "<tr><TD>&nbsp</td></tr>";
print "<td colspan=4><Font size=+1><b> Headless Repositories</b></font></td></tr>\n";
  opendir(DIRHANDLE, "/opt/svnroot/headless") || die "Cannot opendir /opt/svnroot/headless: $!";
  $colnum=1;
  foreach $name (sort readdir(DIRHANDLE)) {
    if($name =~ /^\./) { 
       next;
    } else {
       if ($colnum==4) {$colnum=1;}
       print "<TR>\n" if $colnum==1;
       print "<TD><A HREF=\"$svnhost/headless/$name\">$name</A></TD>\n";
       print "</TR>\n" if $colnum==3;
       $colnum++;
    }
  }

print "<tr><TD>&nbsp</td></tr>";
print "<td colspan=4><Font size=+1><b> Retired Repositories</b></font></td></tr>\n";
  opendir(DIRHANDLE, "/opt/svnroot/retired") || die "Cannot opendir /opt/svnroot/retired: $!";
  $colnum=1;
  foreach $name (sort readdir(DIRHANDLE)) {
    if($name =~ /^\./) { 
       next;
    } else {
       if ($colnum==4) {$colnum=1;}
       print "<TR>\n" if $colnum==1;
       print "<TD><A HREF=\"$svnhost/retired/$name\">$name</A></TD>\n";
       print "</TR>\n" if $colnum==3;
       $colnum++;
    }
  }

print "<tr><TD>&nbsp</td></tr>";
print "<td colspan=4><Font size=+1><b>Sandbox Repositories</b></font></td></tr>\n";
  opendir(DIRHANDLE, "/opt/svnroot/sandbox") || die "Cannot opendir /opt/svnroot/sandbox: $!";
  $colnum=1;
  foreach $name (sort readdir(DIRHANDLE)) {
    if($name =~ /^\./) { 
       next;
    } else {
       if ($colnum==4) {$colnum=1;}
       print "<TR>\n" if $colnum==1;
       print "<TD><A HREF=\"$svnhost/sandbox/$name\">$name</A></TD>\n";
       print "</TR>\n" if $colnum==3;
       $colnum++;
    }
  }

print "</table>\n";
=pdo
print "<H1>Subversion Account Self-Help Tools</H1>";
print "<A HREF=\"/svn/main.cgi\">Subversion account creation</a></br>\n"; 
print "<A HREF=\"/svn/whoisq.cgi\">Subversion account user info retrieval</a></br>\n"; 
print "<A HREF=\"/svn/email-pass.cgi\">Reset and email lost password </a></br>\n"; 
print "<A HREF=\"/svn/email-user.cgi\">Email Username for email address</a></br>\n"; 
print "<A HREF=\"/svn/update-info.cgi\">Update your account info</a>*</br>\n"; 
print "<A HREF=\"/svn/reset-password.cgi\">Change your account password</a>*</br>\n"; 
print "<font color=red>* requires current password<BR>\n";
=cut
print "<\/body>\n";
print "<\/html>\n";

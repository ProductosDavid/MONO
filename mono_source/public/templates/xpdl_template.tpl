<% define 'Root' do %>
	<% file 'proceso_out.xpdl' do %>

    <?xml version="1.0" encoding="UTF-8" standalone="no"?>

	<xpdl:Package xmlns:xpdl="http://www.wfmc.org/2008/XPDL2.1" xmlns="http://www.wfmc.org/2008/XPDL2.1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Id="<%= id[0] %>" Name="<%= name[0] %>" xsi:schemaLocation="http://www.wfmc.org/2008/XPDL2.1 http://www.wfmc.org/standards/docs/bpmnxpdl_31.xsd">
    <%iinc%>
    <xpdl:PackageHeader>
    <%iinc%>
    <xpdl:XPDLVersion><%= version[0] %></xpdl:XPDLVersion>
    <xpdl:Vendor><%= vendor[0] %></xpdl:Vendor>
    <xpdl:Created><%= created[0] %></xpdl:Created>
    <%idec%>
    </xpdl:PackageHeader>

	<xpdl:Script Type="text/javascript"/>

    <xpdl:Participants>
    <%iinc%>
	<% for participant in participants %>
        <xpdl:Participant Id="<%= participant.id %>" Name="<%= participant.name %>">
        <%iinc%>
        <% for participantType in participant.participantTypes %>
            <xpdl:ParticipantType Type="<%= participantType.type %>"/>
        <% end %>
        <%idec%>
        </xpdl:Participant>
    <% end %>
    <%idec%>
    </xpdl:Participants>

    <xpdl:Artifacts>
    <%iinc%>
	<% for artifact in artifacts %>
        <xpdl:Artifact Id="<%= artifact.id %>" Name="<%= artifact.name %>" ArtifactType="DataObject">
        </xpdl:Artifact>
    <% end %>
    <%idec%>
    </xpdl:Artifacts>

    <xpdl:Associations>
    <%iinc%>
	<% for association in associations %>
        <xpdl:Association Id="<%= association.id %>" AssociationDirection="<%= association.direction %>" Source="<%= association.source %>" Target="<%= association.target %>">
        </xpdl:Association>
    <% end %>
    <%idec%>
    </xpdl:Associations>

    <xpdl:Pools>
     <%iinc%>
        <xpdl:Pool BoundaryVisible="true" Id="newpkg1_pool1" MainPool="true" Name="newpkg1_wp1" Orientation="HORIZONTAL" Process="<%= workflowProcesses[0].id %>">
        <%iinc%>
            <xpdl:Lanes>
            <%iinc%>
            <% for participant in participants %>
                <xpdl:Lane Id="<%= participant.id %>" Name="<%= participant.name %>">
                     <%iinc%>
                    <xpdl:Performers>
                         <%iinc%>
                            <xpdl:Performer><%= participant.id %></xpdl:Performer>
                         <%idec%>
                    </xpdl:Performers>
                    <%idec%>
                </xpdl:Lane>
                <% end %>
                <%idec%>
            </xpdl:Lanes>
            <%idec%>
        </xpdl:Pool>
        <%idec%>
    </xpdl:Pools>

    <xpdl:WorkflowProcesses>

    <%iinc%>
	    <% for workflow in workflowProcesses %>

         <xpdl:WorkflowProcess Id="<%= workflow.id %>" Name="<%= workflow.name %>">
         <%iinc%>
            <xpdl:ProcessHeader>
            <%iinc%>
                <xpdl:Created><%= workflow.created %></xpdl:Created>
            <%idec%>
            </xpdl:ProcessHeader>
         <%idec%>

          <%iinc%>
            <xpdl:Activities>
                <%iinc%>


                    <% for event in workflow.events %>
                        <%iinc%>
                        <xpdl:Activity Id="<%= event.id %>" Name="<%= event.name %>">
                        <%iinc%>

                        <xpdl:Event>
                            <%iinc%>
                                <xpdl:<%= event.type %> Trigger="<%= event.trigger %>"/>
                            <%idec%>
                       </xpdl:Event>
                       <%idec%>

                        </xpdl:Activity>
                        <%idec%>
                    <% end %>

                    <% for activity in workflow.activities %>
                       <xpdl:Activity Id="<%= activity.id %>" Name="<%= activity.name %>">
                       <%iinc%>

                        <xpdl:Implementation><xpdl:No/></xpdl:Implementation>

                        <xpdl:Performers>
                        <%iinc%>
                          <% for performer in activity.performers %>
                            <xpdl:Performer><%= performer.id %></xpdl:Performer>
                          <% end %>
                        <%idec%>
                        </xpdl:Performers>

                       <%idec%>
                       </xpdl:Activity>
                    <% end %>

                    <% for gateway in workflow.gateways %>
                        <xpdl:Activity Id="<%= gateway.id %>" Name="<%= gateway.name %>">
                        <%iinc%>

                        <xpdl:Route GatewayType="<%= gateway.routeType %>"/>
                        <xpdl:TransitionRestrictions>
                        <%iinc%>
                            <xpdl:TransitionRestriction>
                            <%iinc%>
                                <xpdl:<%= gateway.splitJoin %> Type="<%= gateway.splitType %>">
                                <%iinc%>

                                    <% if(gateway.transitionRefs.count > 0) %>
                                        <xpdl:TransitionRefs>
                                        <% for transitionRef in gateway.transitionRefs %>
                                            <xpdl:TransitionRef Id="<%= transitionRef.id %>"/>
                                        <% end %>
                                        </xpdl:TransitionRefs>
                                    <% end %>

                                <%idec%>
                                </xpdl:<%= gateway.splitJoin %>>
                            <%idec%>
                            </xpdl:TransitionRestriction>
                        <%idec%>
                        </xpdl:TransitionRestrictions>

                        <%idec%>
                        </xpdl:Activity>
                    <% end %>


                <%idec%>
            </xpdl:Activities>
            <%idec%>


          <%iinc%>
            <xpdl:Transitions>
            <%iinc%>
                <% for transition in workflow.transitions %>
                    <xpdl:Transition From="<%= transition.from %>" Id="<%= transition.id %>" To="<%= transition.to %>" />
                 <% end %>
            <%idec%>
            </xpdl:Transitions>
          <%idec%>

         </xpdl:WorkflowProcess>

	    <% end %>
	<%idec%>

    </xpdl:WorkflowProcesses>

    <%idec%>
    </xpdl:Package>
	<% end %>
<% end %>